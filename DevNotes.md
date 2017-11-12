Beacon-App expands on the ERC20 (StandardToken) contract, emulating the functionalities of basic banking services.

"transfer" function allows for complete control of user account. This control can be limited through the "approve" & "transferFrom" functions, as well as creating sub-accounts for client

Currently, Beacon-App smart contract needs to be connected to a basic Express web app. UI/UX functionalities include: 1) making payments from a particular account, 2) move funds across user's internal accounts (checking / saving / etc...), and 3) showcase basic operations of automated saving (i.e. put aside $0.5 for every transaction spent from user's account)
