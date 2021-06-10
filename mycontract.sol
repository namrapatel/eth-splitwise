// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here

pragma solidity ^0.6.6;

contract SplitwiseContract {
    
    mapping(address => mapping(address => uint32)) IOU;
    mapping(address => uint32) totalAmountOwed;
    
    // returns the amount that the debtor owes the creditor
    function lookup (address debtor, address creditor) public view returns (uint32 ret) {
        return IOU[debtor][creditor];
    }
    
    // msg.sender now owes amount more dollars to creditor
    function add_IOU(address creditor, uint32 amount) external {
        IOU[msg.sender][creditor] = amount;
        totalAmountOwed[msg.sender] += amount;
    }
    
    function viewTotalOwed(address debtor) external view returns (uint32 ret) {
        return totalAmountOwed[debtor];
    }
    
    
}