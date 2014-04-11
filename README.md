ejabberd-easy_cluster
====

Make multi-master Ejabberd clustering possible, make it easy. Also ease the process of a slave Ejabberd node joining an existing cluster using a traditional master->slave configuration.  


#### For detailed information of configuration please see these blog posts:

**basic configuration**  
http://chad.ill.ac/post/35967173942/easy-ejabberd-clustering-guide-mnesia-mysql

**more detail on multi-master clustering**  
http://chad.ill.ac/post/55193155663/easy-ejabberd-clustering-multi-master-fault-tolerant

* * *

#### A NOTE REGARDING MULTI-MASTER CLUSTERING:
This configuration is being run in *our environment* but I **cannot call it ready for a every production enviornment**, other users have reported issues regarding configurations that I am unable to troubleshoot or support due to time and responsability contraints.  These issues range from package managers default configuration file locations to netsplits partitioning networks that aren't run on VLANS. 

That said, we have been running this configuration in a production enviornment and have not had any issues as a result of it... **use multi-master clustering at your own risk.**

* * *

Here is a quick run down of the process once you're got everything properly configured.
====

**Start the server**

    $ejabberdctl start  
    
**Drop to live debug shell of running server**

    $ejabberdctl debug
    
**You'll see this message, press enter**

    --------------------------------------------------------------------

    IMPORTANT: we will attempt to attach an INTERACTIVE shell
    to an already running ejabberd node.
    If an ERROR is printed, it means the connection was not successful.
    You can interact with the ejabberd node if you know how to use it.
    Please be extremely cautious with your actions,
    and exit immediately if you are not completely sure.

    To detach this shell from ejabberd, press:
      control+c, control+c

    --------------------------------------------------------------------
    To bypass permanently this warning, add to ejabberdctl.cfg the line:
      EJABBERD_BYPASS_WARNINGS=true
    Press any key to continue
    
    [PRESS ENTER KEY HERE]
    
    (your information will likely be different here...)
    Erlang R16B03-1 (erts-5.10.4) [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:true]

    Eshell V5.10.4  (abort with ^G)
    (ejabberd@server2.yourhost.com)1>
    
**Load the `easy_cluster` module**

    (ejabberd@server2.yourhost.com)1>l('easy_cluster').
    {module,easy_cluster} 

**Test to make sure the node is properly configured and reachable**

    (ejabberd@server2.yourhost.com)2>easy_cluster:test_node('ejabberd@server1.yourhost.com').
    server is reachable.  
    ok                    
    
### Pick a cluster type, standard slave OR multi-master
    
**Joining as a standard slave**
    
    (ejabberd@server2.yourhost.com)3>easy_cluster:join('ejabberd@server1.yourhost.com').
    ok
    
**Joining as multi-master node**

    (ejabberd@server2.yourhost.com)3>easy_cluster:join_as_master('ejabberd@server1.yourhost.com').
    ok

**Exit the debug shell while leaving the server instance running**

    (ejabberd@server2.yourhost.com)3>[press Ctrl+c]
    BREAK: (a)bort (c)ontinue (p)roc info (i)nfo (l)oaded
       (v)ersion (k)ill (D)b-tables (d)istribution
    [press Ctrl+c again]
    
**You're done... go test it out and confirm everything is working :)**
