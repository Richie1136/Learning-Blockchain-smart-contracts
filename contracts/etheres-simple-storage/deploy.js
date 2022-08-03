import { ethers } from "ethers"
import fs from 'fs-extra'

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
  const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:7545")
  const wallet = new ethers.Wallet('3e9e1baa7cae37afcbb69ae5477272c6c2efdabc95aa7a1191af5d1896ec0807', provider)
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf-8")
  const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf-8")
  // A contract factory is just an object that you can use to deploy contracts.

  const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
  console.log("Deploying please wait")
  const contract = await contractFactory.deploy() // STOP here! Wait for contract to deploy
  console.log(contract)
}

main().then(() => process.exit(0))
  .catch((error) => {
    console.log(error)
    process.exit(1)
  })