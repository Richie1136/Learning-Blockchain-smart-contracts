import { ethers } from "ethers"
import fs from 'fs-extra'
import 'dotenv/config'

// Deploying a contract is actually just sending a transaction

// ABI or application binary interface is incredibly important for working with 
// contracts

// synchronous [solidity]
// asynchronous [javascript] - can have code running at the same time

// Synchronous
// 1. Put popcorn in microwave => promise
// 2. WAit for popcorn to finish.
// 3. Pour drinks for everyone

// Asynchronous
// 1. Put popcorn in the microwave
// 2. Pour drinks for everyone
// 3. Wait for popcorn to finish


// Promise

// Pending
// Fulfilled
// Rejected


// Setup Move Night

// Cook popcorn
// Pour Drinks
// Start Movie


const setupMovieNight = async () => {
  await cookPopcorn()
  await pourDrinks()
  startMovie()
  // deploy a contract? WAit for it to be deployed.
  // contract.deploy => wouldn't wait for it to finish, if it wasn't a async function
}

const cookPopcorn = () => {
  return Promise
}

const main = async () => {
  // compile them in our code
  // compile them separately
  // http://127.0.0.1:7545
  const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL)
  // const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider)
  const encryptedJson = fs.readFileSync('./encryptedKey.json', "utf-8")
  let wallet = new ethers.Wallet.fromEncryptedJsonSync(encryptedJson, process.env.PRIVATE_KEY)
  wallet = await wallet.connect(provider)
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf-8")
  const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf-8")
  // A contract factory is just an object that you can use to deploy contracts.

  const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
  // console.log("Deploying please wait")
  const contract = await contractFactory.deploy() // STOP here! Wait for contract to deploy
  await contract.deployTransaction.wait(1)
  console.log(`Contract Address: ${contract.address}`)
  // You only get a transaction receipt, when you wait for a block confirmation. 
  // Otherwise, you're gonna get the contract object, which has the deploy transaction with it
  // console.log("Here is the deployment transaction (transaction response): ")
  // console.log(contract.deployTransaction)
  // console.log("Here is the transaction Receipt: ")
  // Receipt is what you get when you wait for a transaction and then response is 
  // what you initially get
  // console.log(transactionReceipt)

  // console.log("Let's deploy with only transaction data")

  // const nonce = await wallet.getTransactionCount()

  // const tx = {
  // nonce is a number associated with a unique transaction
  // nonce when talking about blockchain mining is a value used to solve a hard problem

  // Every time you change the blockchain, every time you change state, every time 
  // you use gas, your sending a transaction that looks pretty much exactly like this,
  // the data is going to be the differentiator, the data in this is saying to create a new contract, 
  // when you make a transaction, like adding people or storing the data that we're going to be 
  // passing in our transaction is going to be data associated with calling functions. 
  // Ethers and hard hat are going to make this process a lot easier.

  //     nonce: nonce,
  //     gasPrice: "20000000000",
  //     gasLimit: "1000000",
  //     to: null,
  //     value: 0,
  //     data: "0x608060405234801561001057600080fd5b50610608806100206000396000f3fe608060405234801561001057600080fd5b50600436106100625760003560e01c80632e64cec114610067578063471f7cdf146100855780636057361d146100a35780636f760f41146100d15780638bab8dd5146101965780639e7a13ad14610265575b600080fd5b61006f610313565b6040518082815260200191505060405180910390f35b61008d61031c565b6040518082815260200191505060405180910390f35b6100cf600480360360208110156100b957600080fd5b8101908080359060200190929190505050610322565b005b610194600480360360408110156100e757600080fd5b810190808035906020019064010000000081111561010457600080fd5b82018360208201111561011657600080fd5b8035906020019184600183028401116401000000008311171561013857600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019092919050505061032c565b005b61024f600480360360208110156101ac57600080fd5b81019080803590602001906401000000008111156101c957600080fd5b8201836020820111156101db57600080fd5b803590602001918460018302840111640100000000831117156101fd57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290505050610413565b6040518082815260200191505060405180910390f35b6102916004803603602081101561027b57600080fd5b8101908080359060200190929190505050610441565b6040518083815260200180602001828103825283818151815260200191508051906020019080838360005b838110156102d75780820151818401526020810190506102bc565b50505050905090810190601f1680156103045780820380516001836020036101000a031916815260200191505b50935050505060405180910390f35b60008054905090565b60005481565b8060008190555050565b61033461050d565b6040518060400160405280838152602001848152509050816001846040518082805190602001908083835b60208310610382578051825260208201915060208101905060208303925061035f565b6001836020036101000a038019825116818451168082178552505050505050905001915050908152602001604051809103902081905550600281908060018154018082558091505060019003906000526020600020906002020160009091909190915060008201518160000155602082015181600101908051906020019061040b929190610527565b505050505050565b6001818051602081018201805184825260208301602085012081835280955050505050506000915090505481565b6002818154811061045157600080fd5b9060005260206000209060020201600091509050806000015490806001018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156105035780601f106104d857610100808354040283529160200191610503565b820191906000526020600020905b8154815290600101906020018083116104e657829003601f168201915b5050505050905082565b604051806040016040528060008152602001606081525090565b828054600181600116156101000203166002900490600052602060002090601f01602090048101928261055d57600085556105a4565b82601f1061057657805160ff19168380011785556105a4565b828001600101855582156105a4579182015b828111156105a3578251825591602001919060010190610588565b5b5090506105b191906105b5565b5090565b5b808211156105ce5760008160009055506001016105b6565b509056fea264697066735822122050c9c7b5fdffa22537dd2d3eb7f13a07b746a0132a3553c0be5dfad51d53794d64736f6c63430007050033",
  //     chainId: 1337,
  //   }


  //   const sendTxResponse = await wallet.sendTransaction(tx)
  //   await sendTxResponse.wait(1)
  //   console.log(sendTxResponse)

  // Interacting with Contracts in Ethersjs

  // The contract object is going to come with all the functionality described in 
  // our ABI, thats why you have to pass the ABI to the contract factory.

  const currentFavoriteNumber = await contract.retrieve() // View function, this contract call won't cost any gas.
  console.log(`Current Favorite Number: ${currentFavoriteNumber.toString()}`)
  const transactionResponse = await contract.store("7")
  const transactionReceipt = await transactionResponse.wait(1)
  const updatedFavoriteNumber = await contract.retrieve()
  console.log(`Updated Favorite number is ${updatedFavoriteNumber}`)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error)
    process.exit(1)
  })