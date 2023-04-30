// // Implementation contract - contains the business logic of the contract
// contract MyContractImpl {
//     uint256 public myValue;

//     function setValue(uint256 _newValue) external {
//         myValue = _newValue;
//     }
// }

// // Admin contract - used to manage the administration of the Transparent Proxy
// contract MyContractAdmin {
//     address public implementation;
//     address public admin;

//     constructor(address _implementation) {
//         implementation = _implementation;
//         admin = msg.sender;
//     }

//     function setImplementation(address _newImpl) external {
//         require(msg.sender == admin, "Only admin can change the implementation");
//         implementation = _newImpl;
//     }
// }

// // Transparent Proxy contract - acts as an interface between the user and the implementation contract
// contract MyContractProxy {
//     address public admin;

//     constructor(address _admin) {
//         admin = _admin;
//     }

//     function() external payable {
//         address implementation = MyContractAdmin(admin).implementation();
//         assembly {
//             calldatacopy(0, 0, calldatasize())
//             let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)
//             returndatacopy(0, 0, returndatasize())
//             switch result
//             case 0 {
//                 revert(0, returndatasize())
//             }
//             default {
//                 return(0, returndatasize())
//             }
//         }
//     }
// }
