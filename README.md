Percycraft
==========

I made this Minecraft server so that my son and I can play Minecraft together, with various mods and so on. 

This project is indebted to the fine work of [docker-minecraft-server](https://github.com/itzg/docker-minecraft-server), [minecraft-spot-pricing](https://github.com/vatertime/minecraft-spot-pricing) and [lazymc](https://github.com/timvisee/lazymc).

Despite what some on the internet may say, one cannot run a simultaneous multiplayer server on a potato. In Minecraft, single threaded performance is king and, when running mods, a generous side of RAM is needed too.

Percycraft deploys to AWS a Java Minecraft server with mods loaded via Fabric.

To control costs, while balancing the user experience, Percycraft takes the following approach:

By default Percycraft is only continuously running minimal services: backup storage, file server and the lobby.

When one connects to Percycraft they are going via the lobby. If Percycraft is currently running, the request is proxied forward transparently and Minecraft starts as normal. Otherwise, the Minecraft server is started up as a Spot Instance, and then the player can connect as normal after a few minutes.

Once the last player disconnects, if the server is idle for more than an hour it shuts down.

At shutdown the Minecraft server is backed up.

As the server was set up with my son in mind, to mitigate his lack of patience, Percycraft is also configured to start up at certain likely usage times (weekends and evenings) so it is immediately ready even if no one has recently tried to connect.

The selection of mods I've chosen is motivated by the desire to track the look and feel of my favourite Minecraft Youtubers such as those on the [Hermitcraft](https://hermitcraft.com/) series.

The file server is to aid users in downloading the correct Resource Packs and an installer for client-side mods.

[Here](http://cdn.pcraft.co.uk/album/latest.png) is the world so far!

For players
-----------

1. Tell the admin (me) your Minecraft user name so I can add you to the allow list
2. Install the [Fabric Loader](https://fabricmc.net/use/); this will enable you to select the Fabric version of Minecraft in the Minecraft Launcher when you start the game
3. *Windows*: Install the [client mods](http://cdn.pcraft.co.uk/percycraft-installer.exe)
   *Others*: download the client mods from [here](http://cdn.pcraft.co.uk/mods) and place them in the `/mods` directory of your Minecraft
4. Launch the game, choose Multiplayer, and add the Percycraft server lobby `lobby.pcraft.co.uk`.
5. **Congratulations, you've joined the Percycraft server!**

For server admins
-----------------
If you want your own Percycraft:

1. Create an AWS Stack using the [Cloudformation template](aws/cf.yml)
2. Enjoy

