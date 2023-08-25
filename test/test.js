const { expect } = require("chai");

describe("Fragment one", () => {
    let owner, user1, user2, token, mainobj,user3,user4,user5,user6,user7,user8

    beforeEach(async function () {
        [owner, user1, user2,user3,user4,user5,user6,user7,user8] = await ethers.getSigners()

        mynftcon = await ethers.getContractFactory("Mynft")
        mynftobj = await mynftcon.deploy()

        token = await ethers.getContractFactory("Marketplace")
        mainobj = await token.deploy(mynftobj.address)

    })

    it("check mints", async () => {
      await mynftobj.mint(1,2);
      await mynftobj.setApprovalForAll(mainobj.address,true);
      await mainobj.List(1);
      await mainobj.connect(user1).Buy(1);
      expect(await mainobj.totaltokensof(user1.address)).to.equal(1);

    })

    it("check price", async () => {
      await mynftobj.mint(1,2);
  
      expect(await mynftobj.balanceOf(owner.address)).to.equal(2);

    })
 

     


   
})