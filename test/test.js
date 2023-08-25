const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Fragment one", () => {
  let owner, user1, user2, token, mainobj, user3, user4, user5, user6, user7, user8

  beforeEach(async function () {
    [owner, user1, user2, user3, user4, user5, user6, user7, user8] = await ethers.getSigners()

    mynftcon = await ethers.getContractFactory("Mynft")
    mynftobj = await mynftcon.deploy()

    token = await ethers.getContractFactory("Marketplace")
    mainobj = await token.deploy(mynftobj.address)

  })

  it.only("check mints", async () => {

    await mynftobj.mint(1);
    await mynftobj.setApprovalForAll(mainobj.address, true);
    await mainobj.List(1,2);
    await mainobj.connect(user1).Buy(1,{ value: 2 });
    expect(await mainobj.totaltokensof(user1.address)).to.equal(1);
  })



  it.only("check ", async () => {

     const initbalance = await owner.getBalance();
    const prevbal = ethers.utils.formatEther(initbalance);

    await mynftobj.mint(1);
    await mynftobj.setApprovalForAll(mainobj.address, true);
    const etherAmount = ethers.utils.parseEther('2');
    await mainobj.List(1,etherAmount);

    const buyamountinethers = ethers.utils.parseEther('4');
    await mainobj.connect(user1).Buy(1,{ value: buyamountinethers });

    const afterbalance = await owner.getBalance();
    const afterbal = ethers.utils.formatEther(afterbalance);

    const user1balance = await user1.getBalance();
    const user1bal = ethers.utils.formatEther(afterbalance);

    expect(prevbal).to.equal(afterbal);
  })

  it.only("require ", async () => {

    const initbalance = await owner.getBalance();
   const prevbal = ethers.utils.formatEther(initbalance);

   await mynftobj.mint(1);
   await mynftobj.setApprovalForAll(mainobj.address, true);
   const etherAmount = ethers.utils.parseEther('2');
   await mainobj.List(1,etherAmount);

   const buyamountinethers = ethers.utils.parseEther('1');
   
   await expect( mainobj.connect(user1).Buy(1,{ value: buyamountinethers })).to.be.revertedWith('you dont have enough ethers')
   
 })




})