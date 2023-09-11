Percycraft
==========

I made this Minecraft server so my son and I can play Minecraft, with various mods and so on. 

This project is indebted to the fine work of [itzg/docker-minecraft-server](https://github.com/itzg/docker-minecraft-server) and [minecraft-spot-pricing](https://github.com/vatertime/minecraft-spot-pricing).

It deploys to AWS a Fabric Java Minecraft server with mods. The cloud infrastructure uses scheduled auto scaling to turn the server off and on and spot pricing while it is on to keep things affordable. The deployment also features a file server to aid the downloading of the correct Resource Packs and Client Mods to your computer. The server also has installed Minecraft administration tools [mcrcon](https://github.com/Tiiffi/mcrcon) and [MCA Selector](https://github.com/Querz/mcaselector) to help me keep things tidy.

The selection of mods I've chosen is motivated by the desire to track the look and feel of [Hermitcraft](https://hermitcraft.com/).

For players
-----------

1. Tell the admin (me) your Minecraft user name so I can add it to the allow list

2. Install the [Fabric Loader](https://fabricmc.net/use/); this will allow you to select the Fabric version of Minecraft in the Minecraft Launcher when you start the game

3. Download the client mods from [Percycraft](http://pcraft.co.uk:8080/mods) and place them in the `/mods` directory of your Minecraft (e.g. somewhere like `%APPDATA%\.minecraft\mods` on Windows)

4. Load the game up, choose Multiplayer, and add server `pcraft.co.uk`.
  
5. **Congratulations, you've joined the Percycraft server!**


For server admins
-----------------
If you want your own Percycraft:

1. Create an AWS Stack using the Cloudformation template `aws/cf.yml`

3. Enjoy
