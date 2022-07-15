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
}

main().then(() => process.exit(0))
  .catch((error) => {
    console.log(error)
    process.exit(1)
  })