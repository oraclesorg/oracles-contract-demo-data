pragma solidity ^0.4.14;

import "oracles-contract-key/KeyClass.sol";
import "oracles-contract-validator/ValidatorClass.sol";
import "oracles-contract-ballot/BallotClass.sol";

contract DemoData is KeyClass, ValidatorClass, BallotClass {
    address[] private demoInitialKeys = [0x70de02424c1b3b1ada0fab8dd1d70e04727bd082];
    address[] private demoValidators = [0xDd0BB0e2a1594240fED0c2f2c17C1E9AB4F87126];
    address[] private demoDisabledValidators = [0x00bA7Af2c7a8d724BF526e79B965D1Ae7748AA33];
    address[] private demoPayoutKeys = [0xDd0BB0e2a1594240fED0c2f2c17C1E9AB4F87126];
    address[] private demoVotingKeys = [0xDd0BB0e2a1594240fED0c2f2c17C1E9AB4F87126];
    uint[] private demoBallots = [11749347, 29908500, 37079255, 23661745];
    
    function DemoData() {
        //demo keys
        for (uint k = 0; k < demoInitialKeys.length; k++) {
            initialKeys[demoInitialKeys[k]] = InitialKey({isNew: true});
        }
        for (uint l = 0; l < demoValidators.length; l++) {
            miningKeys[demoValidators[l]] = MiningKey({isActive: true});
        }
        for (uint m = 0; m < demoPayoutKeys.length; m++) {
            payoutKeys[demoPayoutKeys[m]] = PayoutKey({isActive: true});
        }
        for (uint n = 0; n < demoVotingKeys.length; n++) {
            votingKeys[demoVotingKeys[n]] = VotingKey({isActive: true});
        }
        
        //demo validators
        for (uint i = 0; i < demoValidators.length; i++) {
            validators.push(demoValidators[i]);
        }
        for (uint j = 0; j < demoDisabledValidators.length; j++) {
            disabledValidators.push(demoDisabledValidators[j]);
        }
        
        validator[0x0083d7E016DEb94836443aAF997f63DcA13cd66f] = Validator({
            fullName: "John A Stearn", 
            streetName: "4604 Ridenour Street", 
            state: "IN", 
            zip: 46785, 
            licenseID: 4029833344, 
            licenseExpiredAt: 1553126400, 
            disablingDate: 0, 
            disablingTX: ""
        });
        validator[0x004705e3796589ba255EFD3B4C13f85dAEBd66cE] = Validator({
            fullName: "Joan W Brink", 
            streetName: "748 Summit Park Avenue", 
            state: "MI", 
            zip: 48342, 
            licenseID: 652162544616,
            licenseExpiredAt: 1764892800, 
            disablingDate: 0, 
            disablingTX: ""}
        );
        validator[0x00bA7Af2c7a8d724BF526e79B965D1Ae7748AA33] = Validator({
            fullName: "Daniel C Liss", 
            streetName: "1943 College Street", 
            state: "GA", 
            zip: 30030, 
            licenseID: 253532376, 
            licenseExpiredAt: 1604275200, 
            disablingDate: 1490400000, 
            disablingTX: "0xfbc9899cc374b95bdee3f042ba2b12b69a9cfeca008d701c11896bf38f167118"
        });
        validator[0x70de02424c1b3b1ada0fab8dd1d70e04727bd082] = Validator({
            fullName: "Betty T Suber", 
            streetName: "1870 Froe Street", 
            state: "WV", 
            zip: 25301, 
            licenseID: 8385124, 
            licenseExpiredAt: 1622332800, 
            disablingDate: 0, 
            disablingTX: ""
        });
        validator[0xDd0BB0e2a1594240fED0c2f2c17C1E9AB4F87126] = Validator({
            fullName: "David D Strunk", 
            streetName: "2223 Confederate Drive", 
            state: "FL", 
            zip: 32305, 
            licenseID: 261310533, 
            licenseExpiredAt: 1653263999, 
            disablingDate: 0, 
            disablingTX: ""
        });
        
        //demo ballots
        for (uint iii = 0; iii < demoBallots.length; iii++) {
            ballots.push(demoBallots[iii]);
        }
        ballotsMapping[demoBallots[0]] = Ballot({
            owner: msg.sender,
            miningKey: 0x5bf25597c2dc66d7f7153b22237962aed7461391,
            memo: "Remove notary Shawn P Grey, Vermont ID: 55512345, DOB: 5/10/1975 from the network. Reason: Notary license expiration", 
            createdAt: now,
            votingStart: 1494838800,
            votingDeadline: 1501718400,
            votesAmmount: 20,
            result: -2,
            addAction: false,
            active: true
        });
        ballotsMapping[demoBallots[1]] = Ballot({
            owner: msg.sender,
            miningKey: 0xbb232c047d99d39eab8543de8e913a01af85aed0,
            memo: "Add notary Gary G Love, Indiana ID: 4353859, DOB: 5/10/1968 to the network", 
            createdAt: 1493942400,
            votingStart: 1493942400,
            votingDeadline: 1500768000,
            votesAmmount: 30,
            result: 4,
            addAction: true,
            active: true
        }); 
        ballotsMapping[demoBallots[2]] = Ballot({
            owner: msg.sender,
            miningKey: 0x0083d7E016DEb94836443aAF997f63DcA13cd66f,
            memo: "Add notary John A Stearn, Vermont ID: 34882346728, DOB: 11/5/1972 to the network", 
            createdAt: 1493942400,
            votingStart: 1493942400,
            votingDeadline: 1490257231,
            votesAmmount: 20,
            result: 5,
            addAction: true,
            active: false
        });
        ballotsMapping[demoBallots[3]] = Ballot({
            owner: msg.sender,
            miningKey: 0x00bA7Af2c7a8d724BF526e79B965D1Ae7748AA33,
            memo: "Remove notary Daniel C Liss, Georgia ID: 3849328423, DOB: 2/8/1978 from the network", 
            createdAt: 1485159631,
            votingStart: 1485159631,
            votingDeadline: 1492935631,
            votesAmmount: 24,
            result: 2,
            addAction: false,
            active: false
        });
    }
}