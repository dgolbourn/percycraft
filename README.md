Percycraft
==========

I made this Minecraft server so my son and I can play Minecraft, with various mods and so on. 

This project is indebted to the fine work of [itzg/docker-minecraft-server](https://github.com/itzg/docker-minecraft-server) and [minecraft-spot-pricing](https://github.com/vatertime/minecraft-spot-pricing).

It deploys to AWS a Fabric Java Minecraft server with mods. The cloud infrastructure uses auto scaling and spot pricing to keep things affordable. The deployment also features a file server to aid the downloading of the correct Resource Packs and Mods to your client. The server also has installed Minecraft administration tools [mcrcon](https://github.com/Tiiffi/mcrcon) and [MCA Selector](https://github.com/Querz/mcaselector) to help me keep things tidy.

The selection of mods I've chosen is inspired by the desire to track the look and feel of [Hermitcraft](https://hermitcraft.com/).

For players
-----------

1. Tell the admin (me) your Minecraft user name so I can add it to the allow list

2. Get the `<Percycraft server IP address>` from said admin

3. Install the [Fabric Loader](https://fabricmc.net/use/); this will allow you to select the Fabric version of Minecraft in the Minecraft Launcher when you start the game

5. Download:
    * Simple Voice Chat (`http://<Percycraft server IP address>:8080/mods/voicechat-fabric-1.20.1-2.4.24.jar`)
    * Fabric API (`http://<Percycraft server IP address>:8080/mods/fabric-api-0.88.1+1.20.1.jar`)
and place them in the `/mods` directory of your Minecraft (e.g. somewhere like `%APPDATA%\.minecraft\mods` on Windows)

6. Load the game up, choose Multiplayer, and add `<Percycraft server IP address>`.
  
7. **Congratulations, you've joined the Percycraft server!**


For server admins
-----------------

1. Create an AWS Stack using the Cloudformation template `aws/cf.yml`

3. Enjoy

Or, if you just want to run the Percycraft server locally, type `docker compose -f ./docker-compose.mc_init.yml up` followed by `docker compose -f ./docker-compose.mc.yml up` from the project root
