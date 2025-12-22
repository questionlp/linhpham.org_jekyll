---
layout: post
title:  "Wait Wait Stats Infrastructure Updates"
date:   2023-01-22 21:00:00 -0700
tags:   stats waitwait infrastructure
---

Up through today, the infrastructure that hosts the Wait Wait Stats Page and its related sites is made up of 6 servers running on [DigitalOcean](https://www.digitalocean.com/?refcode=511267eeda51&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge") (referral link):

* 1x Front-end NGINX server that acts as a load balancer and a caching reverse proxy
* 3x Web application servers, each running an instance of the Stats Page, Stats API, Graphs and Reports Flask- or FastAPI-based applications, served through NGINX
* 1x MySQL database server that hosts the Wait Wait Stats database

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/wait-wait-stats-infrastructure-2022.png">
    <img src="/assets/images/wait-wait-stats-infrastructure-2022.png" class="img-fluid border" alt="Wait Wait Stats Infrastructure Diagram for 2022">
    </a>
    <figcaption class="figure-caption text-center">
        Diagram of the Wait Wait Stats infrastructure in 2022
    </figcaption>
</figure>

This was initially done to break out the roles and responsibilities and allow for some load sharing and redundancy for the servers that hosts the applications. It still left a single point of failure for the front-end NGINX server (though that could easily be resolved) and for the MySQL database server (which can also be resolved by using MySQL replication).

That said, it was absolute overkill for actual hosting needs for all of the sites. So, I decided to go with an all-in-one server approach; which, is similar to how I used to host the Wait Wait Stats Page before adding in the Stats API, Reports and Graphs sites.

The all-in-one server approach will serve the applications through NGINX, acting solely as a caching reverse proxy, and a local instance of MySQL Server to host the Stats database. If the load on the system starts to grow and get overwhelmed, I can easily spin up another server that I can off-load the Reports, Graphs and/or Stats API web applications.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/wait-wait-stats-infrastructure-2023.png">
    <img src="/assets/images/wait-wait-stats-infrastructure-2023.png" class="img-fluid border" alt="Wait Wait Stats Infrastructure Diagram for 2023">
    </a>
    <figcaption class="figure-caption text-center">
        Diagram of the Wait Wait Stats infrastructure in 2023
    </figcaption>
</figure>

Once I finish pointing all of the traffic to the new server (which is almost complete, as of writing this post), I will start turning down the other servers. That will leave one production server and one staging server. The latter will run applications from the `develop` branch while the former will run tested code that is in the `main` branch.

In addition to reducing my footprint, it has also had a side effect of reducing database query times; due to, not having to traverse a network with potentially inconsistent latency.

Later on, if I want to add some form of redundancy or load balancing, I can spin up another server and use MySQL replication to keep the databases synchronized. Instead of having the two servers be fronted by another server running NGINX, I will opt for DNS load balancing; since, I don't need to worry about handling or managing sessions.
