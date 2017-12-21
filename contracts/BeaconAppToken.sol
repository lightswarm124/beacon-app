pragma solidity ^0.4.8;

//  Beacon App Transaction Script (aka. Smart Contract)

contract BeaconAppToken {
    event Transfer (address from, address to, uint256 value);
    event Approval (address from, address spender, uint256 value);

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 public totalSupply;
    uint256 constant MAX_UINT256 = 2**256 - 1;

    //  addresses should mirror addresses in "balances" mapping
    mapping (address => bool) clientPermission;
    address beaconAppOwner;

    modifier noFrozenAccount() {
        require(clientPermission[msg.sender] == true);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == beaconAppOwner);
        _;
    }

    function BeaconAppToken(uint256 _initialAccountDeposit) {
        beaconAppOwner = msg.sender;
        totalSupply = _initialAccountDeposit;
    }

    function depositFunds(uint256 _fundsToDeposit) public noFrozenAccount returns (bool success) {
        require(totalSupply + _fundsToDeposit >= totalSupply);
        balances[msg.sender] += _fundsToDeposit;
        totalSupply += _fundsToDeposit;
        return true;
    }

    function withdrawFunds(uint256 _fundsToWithdraw) public noFrozenAccount returns (bool success) {
        require(balances[msg.sender] >= _fundsToWithdraw);
        balances[msg.sender] -= _fundsToWithdraw;
        totalSupply -= _fundsToWithdraw;
        return true;
    }

    function freezeClientAccount(address _clientAccount) public onlyOwner returns (bool success) {
        clientPermission[_clientAccount] = false;
        return true;
    }

    function unfreezeClientAccount(address _clientAccount) public onlyOwner returns (bool success) {
        clientPermission[_clientAccount] = true;
        return true;
    }

/*
*   ERC20 Functions with original variable names
*/

    function transfer(address _to, uint256 _value) public noFrozenAccount returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public noFrozenAccount returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        Transfer(_from, _to, _value);
        return true;
    }

    function balanceOf(address _owner) constant public returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public noFrozenAccount returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

//  Refund all ethers deposited into Transaction Script address
    function () public {
        revert();
    }
}
