//manual way to upgrade box

const { ethers } = require("hardhat")

async function main() {
    const boxProxyAdmin = await ethers.getContract("BoxProxyAdmin")
    const transparentProxy = await ethers.getContract("Box_Proxy")

    const proxyBoxV1 = await ethers.getContractAt("Box", transparentProxy.address)
    const versionV1 = await proxyBoxV1.version()
    console.log("BoxV1 version:", versionV1)

    const BoxV2 = await ethers.getContract("BoxV2")

    const upgradeTx = await boxProxyAdmin.upgrade(transparentProxy.address, BoxV2.address)
    await upgradeTx.wait(1)

    const proxyBoxV2 = await ethers.getContractAt("BoxV2", transparentProxy.address)
    const versionV2 = await proxyBoxV2.version()
    console.log("BoxV2 version:", versionV2.toString())
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
