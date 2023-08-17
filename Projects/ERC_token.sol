// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface ERC20Interface {
    function totalSupply() external  view returns (uint256);
    function balanceOf(address _owner) external  view returns (uint256 balance);
    function transfer(address _to, uint256 _token) external  returns (bool success);

    function approve(address _spender, uint256 _token) external  returns (bool success);
    function allowance(address _owner, address _spender) external  view returns (uint256 remaining);
    function transferFrom(address _from, address _to, uint256 _token) external  returns (bool success);

    event Transfer(address indexed _from, address indexed _to, uint256 _token);
    event Approval(address indexed _owner, address indexed _spender, uint256 _token);
}

contract Block is ERC20Interface{
    string public name = "Block";
    string public symbol = "BLK";

    string public decimal;
    uint public override totalSupply;
    address public founder;
    mapping (address=> uint) public balances;
    mapping (address=> mapping (address=> uint)) allowed;

    constructor(){
        totalSupply = 100000;
        founder = msg.sender;
        balances[founder] = totalSupply;
    }

    function balanceOf(address _owner) public  view override  returns (uint256 balance){
        return balances [_owner];
    }

    function transfer(address _to, uint256 _token) public override virtual  returns (bool success){
        require(balances[msg.sender]>= _token);
        balances[_to]+= _token;
        balances[msg.sender]-= _token;
        emit Transfer(msg.sender, _to, _token);
        return true;
    }

    function approve(address _spender, uint256 _token) public override  returns (bool success){
        require(balances[msg.sender]>= _token);
        require(_token>0);
        allowed[msg.sender][_spender]= _token;
        emit Approval(msg.sender, _spender, _token);
        return true;
    }

    function allowance(address _owner, address _spender) public  view override  returns (uint256 remaining){
        return allowed[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _token) public override virtual returns (bool success){
        require(allowed[_from][_to]>= _token);
        require(balances[_from]>= _token);
        balances[_from]-=_token;
        balances[_to]+= _token;
        return true;
    }
}
contract ICO is Block{
    address public manager;
    address payable public deposit;

    uint tokenPrice = 0.1 ether;

    uint public cap = 300 ether;

    uint public raisedAmount;

    uint public icoStart = block.timestamp;
    uint public icoEnd = block.timestamp + 3600;

    uint public tokenTradeTime = icoEnd +3600;

    uint public maxInvest = 10 ether;
    uint public minInvest = 0.1 ether;

    enum State{beforeStart, afterEnd, running, halted}

    State public icoState;

    event Invest(address investor, uint value, uint token);

    constructor(address payable _deposit){
        deposit = _deposit;
        manager = msg.sender;
        icoState = State.beforeStart;
    }

    modifier onlyManager(){
        require(msg.sender == manager);
        _;
    }

    function halt() public onlyManager{
        icoState = State.halted;
    }

    function resume() public onlyManager{
        icoState = State.running;
    }

    function cahngeDepositAddress(address payable newDepositAddress) public  onlyManager{
        deposit = newDepositAddress;
    }

    function getState() public view returns(State){
        if(icoState == State.halted){
            return State.halted;
        }else if(block.timestamp <icoStart){
            return  State.beforeStart;
        } else if (block.timestamp >= icoStart && block.timestamp <= icoEnd){
            return State.running;
        }else {
            return State.afterEnd;
        }
    }

    function invest() payable public returns(bool){
        icoState = getState();
        require(icoState == State.running);
        require(msg.value >= minInvest && msg.value <= maxInvest);

        raisedAmount += msg.value;

        require(raisedAmount <= cap);
        uint tokens = msg.value/tokenPrice;
        balances[msg.sender] += tokens;
        balances[founder] -= tokens;
        deposit.transfer(msg.value);

        emit Invest(msg.sender, msg.value, tokens);
        return true;
    }

    function burn() public returns(bool){
        icoState = getState();
        require(icoState == State.afterEnd);
        balances[founder] =0;
        return true;
    }

    function transfer(address _to, uint _token) public override returns(bool success){
        require(block.timestamp >tokenTradeTime);
        super.transfer(_to, _token);
        return true;
    }

    function transferFrom(address _from, address _to, uint _token) public override returns(bool success){
        require(block.timestamp >tokenTradeTime);
        Block.transferFrom(_from, _to, _token);
        return true;
    }

    receive() external payable{
    invest();
    }

}