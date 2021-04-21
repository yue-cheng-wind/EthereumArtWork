# Ethereum Gallery Distributed App
Final Application link: https://gallery-dapp.herokuapp.com/ 
Video Demo: Link here https://www.youtube.com/watch?v=WKxPW5-rbSU
Wecome to the Ethereum Gallery Distributed App! This is the app built based on Ethereum smart contract, where artist can show their artwork online, and receive financial support from the same website.

## Use Cases
Traditionally, artists display their works via in-person art shows, at museums, and other large events. In recent years, artists have also begun to show their artwork via digital means such as social media. With that said, platforms such as Twitter, Instagram, and Facebook, do not provide a way for artists to be given some sort of funding support from their fans. Normally, artists have to set up alternative platforms, such as Patreon, to receive financial support directly from their community. We propose this application as a way of both enabling artists to showcase their artwork online, and to receive community support from the same website.

## Reason for Using Blockchain
The reasons we decided on a blockchain implementation are the ability to decentralize the application, to have secure payments, and to have immutable traceability of who owns artwork. Decentralization is important because it enables the creator to not be tied to a specific company for support. Our application can be deployed by any artist on their own, and does not require a central authority for receiving payments. This removes the ability for third parties to charge high fees to use their platform. This ties to the second application, which is that the gas cost to deploy the smart contract is a one time fee, and from there, the artist doesn’t pay for anything besides hosting their personal website. All donations go directly to the artist, and a much smaller fee is charged by miners to validate that transaction. Finally, the blockchain can be used as an immutable source for tracing artwork ownership back to the original artist. While we did not implement an NFT in our POC, this could be added as a way of tracing uniqueness and ownership of any piece of art.

## Smart Contract Considerations
Our smart contract is based on a tutorial we followed here: https://github.com/ThisIsCodeXpert/Ethereum-DApp-Best-Beginner-Tutorials-2020. The contract will enable an artist to deploy a website with their artwork, and each artwork will have its likes and tips traced on the blockchain, while also using the blockchain to enable payments from supporters to the artist. Once an artist website and contract are online, they can begin sharing their website across the internet. Supporters can then visit the website to see the artwork, then like/tip pieces of art as they see fit. During the whole process four types of elements are involved: (1) gas free view function (2) non-payable transaction (3) payable transaction (4) event. We will use MetaMask in order to create wallet addresses for users, and as a GUI to process transactions on the blockchain in an easy manner. Eventually, we would like to add ERC NFTs to the network as a way of maintaining digital ownership of a given piece of artwork, which helps protect a small artist’s ownership and traceability of the artwork on the internet.

## ERC Non-Fungible Tokens
Representing artwork in digital forms raises copyright issues. Due to the easiness of duplicating digital information, exposing artwork online poses the risk of the work being stolen. Traditionally, the way to mitigate this issue is to release information in a confined environment, which comes with the cost of limited freedom.  By associating artwork ownership with non-fungible tokens, we eliminate the reliance on such confined environments and give the choice back to the users. Note that we haven’t implemented the ERC Non-fungible token yet and this work is left as part of our future work.

## High Level Architecture
/*****/

The architecture above provides high-level context of how our application would work in a production environment. An artist (or us as a company/provider) would deploy their own gallery smart contract to the ethereum main network, then deploy a website that holds the artwork information and connection to the deployed smart contract. The front end could be hosted using a variety of providers, and the backend/smart contract could easily be deployed using an automated script, Remix, etc. Once everything is deployed, the website link can be shared. Any given user that visits the link would have the front-end sent to their browser from the provider. From there, they can interact with the website, using their MetaMask credentials. Anytime a user “likes” or “tips” an art piece, we will use the Web3 code in the front-end to connect to the deployed smart contract, and process the like action/tip payment accordingly. Tips would be sent to the wallet address of the artist.

## Set Up
* Installation<br>
To run this dapp, you should have installed <br>
(1) Ethereum enabled browser or Metamask (https://metamask.io/) <br>
(2) node (https://nodejs.org/en/download/)<br>
After clone the code to your local laptop, in the terminal do<br>
> $ npm install<br>
> $ node index.js<br>
You will see our gallery dapp at http://localhost:3000/ 
* Interact with Gallery Dapp(as gallery dapp visitor)<br>
(1) Register an account in Metamask<br>
(2) Connect your account in a test network, say “Ropsten Test Network”<br>
(3) Go to the related testnet faucet to get free Ether (https://faucet.ropsten.be/)<br>
(4) Connect your account with our dapp address at http://localhost:3000/<br>
Now you’re good to send ‘like’ or ‘tip’ to the artwork you like!
* View and transfer balance(as gallery dapp owner)<br>
(1) Go to https://remix.ethereum.org/ and select the icon as “Deploy & run transaction” on the left navbar<br>
(2) Select the environment as ‘Injected Web3’, then load the gallery smart contract by pasting its address<br>
(3) As the owner of this gallery smart contract you can now view your income via clicking the ‘viewBalance’ button; and transfer the balance from this gallery address to your account address!<br>

## Analysis (Speed, cost of gas, etc.)
As the gallery smart contract owner we deployed our galley smart contract in Ropsten Test Network, which consumes 0.000732 gas. If we take the latest Ethereum gas price on Apr-20th-2021 as 195.80 Gwei, the deploy cost is 0.143258 Ether. If for the future work we allow more functionality in the smart contract to add/edit art pieces to make it sustainable, and on the frontend we allow the visitor to customize their tip amount, the deployment cost is still worthy of the investment. <br>
The deployment speed is highly related to how much gas price the deployer is willing to pay and how congested the network is. In our case with the average gas fee we’re able to deploy it within 2 minutes.<br>
As the gallery dapp visitor, to send our ‘like’ or tip to the art piece consumes 0.000045 gas only, which with the current Ethereum gas price as 195.80 Gwei the gas fee will be 0.008791 Ether. The increased tip amount, if we further make it customizable, will be reflected on the total transaction fee. <br>
As the gallery dapp owner, to view balance via the gallery smart contract cost no gas since it’s a view function; to withdraw the balance to the owner’s account cost 0.000033 gas, indicating the gas fee of 0.006406 Ether. <br>
Same as the deployment, speed is highly related to gas price and network congestion. During our development process the transaction varies from 10s to 4mins.<br>

## Future Work
If we were to continue working on the project, we would add a few different items. <br>
<br>
First, we would use ERC NFTs to digitally authenticate and trace each art piece, which would be useful for copyright laws that could protect the artist. 
Second, We would improve the robustness of the smart contract to be able to add/delete artwork, as well as modify information about each artwork, in that way this smart contract can be sustainable in the long run.<br>
Third, we will allow the supporters to customize their tip value, for demonstration purposes currently the tip value is set as 10wei. Allowing the customizable tip ensures that support can freely express their appreciation on the art piece, as well as to encourage the artist’s creativity to the largest.<br>
Further, for this proof-of-concept product we have not built a feature for the gallery owner to view the balance and transfer the balance to his/her account on the frontend side, since these two operations can be executed on Remix directly. For completeness purposes we could build the frontend feature to allow the owner to execute these two operations directly.<br>
Finally, on the frontend side we would also build in the ability to add a future projects tab, the ability to follow the artist on social media, a fan messaging platform, a commissions platform to help generate new business for the artist, and so on. There is a lot of potential functionality we could add!

## Sources:
How to use MetaMask for anonymity: https://www.geeksforgeeks.org/how-to-use-metamask-to-deploy-a-smart-contract-in-solidity-blockchain/ <br>
Non-fungible Token Consideration in voting case: https://medium.com/validitylabs/how-to-vote-safely-with-an-erc20-token-518adadbf923 <br>
Ethereum Average Gas Price reference:
https://ycharts.com/indicators/ethereum_average_gas_price#:~:text=Ethereum%20Average%20Gas%20Price%20is,K%25%20from%20one%20year%20ago<br>

