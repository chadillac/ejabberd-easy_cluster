ejabberd-easy_cluster
=====================

Ease the process of a slave ejabberd node joining an existing cluster.

REGARDING MULTI-MASTER CLUSTERING:
==========================================
This software is being run in our environment but I _cannot_ recommend it ready for a every production enviornment, other users have reported issues regarding configurations that I am unable to troubleshoot or support due to time and responsability contraints.  These issues range from package managers default configuration file locations to netsplits partitioning networks that aren't run on VLANs ~~to issues I'm currently troubleshooting regarding our own cluster having erlang, mnesia and filesystem syncing errors causing ejabberd session id's from BOSH clients to be lost.~~ [red herrings!!](https://www.process-one.net/en/ejabberd/release_notes/release_note_ejabberd_2.1.12/)  **Use that configuration at your own risk**.  Any fixes I discover to address issues will be pushed to this repository when they're discovered and pull requests will be merged in if others find and fix issues which might cause this setup to be more stable and less error prone, but currently that **is not** the case and I can't in good faith say this software is **ready for a production enviornment**.  Sorry.

More information and usage details here:

http://chad.ill.ac/post/35967173942/easy-ejabberd-clustering-guide-mnesia-mysql

http://chad.ill.ac/post/55193155663/easy-ejabberd-clustering-multi-master-fault-tolerant
