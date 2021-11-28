const main = async () => {
	const waveContractFactory = await hre.ethers.getContractFactory('WavePortal');
	const waveContract = await waveContractFactory.deploy({
		value: hre.ethers.utils.parseEther('0.1'),
	});
	await waveContract.deployed();
	console.log('Contract addy:', waveContract.address);

	/*
	 * Get Contract balance
	 */
	let contractBalance = await hre.ethers.provider.getBalance(
		waveContract.address
	);
	console.log(
		'Contract balance:',
		hre.ethers.utils.formatEther(contractBalance)
	);

	/*
	 * Send Wave
	 */
	let waveTxn = await waveContract.wave('A message!');
	await waveTxn.wait();

	const waveTxn2 = await waveContract.wave('This is wave #2');
	await waveTxn2.wait();

	/*
	 * Get Contract balance to see what happened!
	 */
	contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
	console.log(
		'Contract balance:',
		hre.ethers.utils.formatEther(contractBalance)
	);

	let allWaves = await waveContract.getAllWaves();
	console.log(allWaves);
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	} catch (error) {
		console.log(error);
		process.exit(1);
	}
};

runMain();

// ? first version of run.js
// const main = async () => {
//   const [owner, randomPerson] = await hre.ethers.getSigners(); // grabbing the wallet address of contract owner and  a random wallet address and called it randomPerson
//   const waveContractFactory = await hre.ethers.getContractFactory('WavePortal'); // This will actually compile our contract and generate the necessary files we need to work with our contract under the artifacts directory
//   const waveContract = await waveContractFactory.deploy();
//   await waveContract.deployed();

//   console.log("Contract deployed to:", waveContract.address);
//   console.log("Contract deployed by:", owner.address);

//   let waveCount;
//   waveCount = await waveContract.getTotalWaves(); //when contract is call this get intial no of total waves

//   let waveTxn = await waveContract.wave();
//   await waveTxn.wait(); // calls d wave

//   waveTxn = await waveContract.connect(randomPerson).wave();
//   await waveTxn.wait();

//   waveCount = await waveContract.getTotalWaves();

//   waveCount = await waveContract.getTotalWaves(); // will show the no of waves after the wave
// };

// const runMain = async () => {
//   try {
//     await main();
//     process.exit(0);
//   } catch (error) {
//     console.log(error);
//     process.exit(1);
//   }
// };

// runMain();

//? The Hardhat Runtime Environment, or HRE for short, is an object containing all the functionality that Hardhat exposes when running a task, test or script. In reality, Hardhat is the HRE.
// * So what does this mean? Well, every time you run a terminal command that starts with npx hardhat you are getting this hre object built on the fly using the hardhat.config.js specified in your code!
