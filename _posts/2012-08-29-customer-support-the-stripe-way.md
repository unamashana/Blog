---
layout: post
title: Customer Support the Stripe way but without Managing Mailing Lists or Filters
author: prateek
tags: [Customer Support]
status: publish
type: post
published: true
---



There was a very interesting post on Hacker News today from Alex Maccaw on what it is to [work at Stripe](http://blog.alexmaccaw.com/stripes-culture). The thing that I (and most [commenters on HN](http://news.ycombinator.com/item?id=4445031)) found interesting was the email culture at Stripe. All emails are copied to almost everyone (or at least to a team). According to Alex “This requires a lot of filtering”

Also, everyone does customer support, on a bi-weekly rotation.

At [SupportBee](https://supportbee.com), we use Stripe for accepting payments and [we love it](https://supportbee.com/devblog/2012/08/25/stripe-integration-in-3-easy-steps/). Occasionally we have interacted with their helpful support team as well. True to their word, every time you email them, a new hacker replies to it. Based on their emails, we tried to reverse engineer their process based on the emails we got. 


### The Stripe Way


The email from their support looks like this


<div class=""><a href="https://skitch.com/prateekdayal/excce/fwd-supportbee-payment-receipt-prateek-supportbee.com-support-bee-mail"><img style="max-width:638px" src="https://img.skitch.com/20120829-dwsmiebh1f1trebimrief3k9mr.medium.jpg" alt="Fwd: SupportBee Payment Receipt - prateek@supportbee.com - Support Bee Mail" /></a><br />
<br/>
</div>

In this case, the reply is from Michael (`michael@stripe_domain.com` but when you reply, the email goes to `support+michael@stripe_domain.com` and is copied to `support@stripe_domain.com`. I believe the reply-to is modified so a label can be applied (using a filter) when it lands in your inbox (as opposed to emails that are coming only to `support@stripe_domain.com` without Michael explicitly in the cc). 

To make this work reliably, Michael has to make sure that the reply-to is set as `michael+support@stripe_domain.com`. May be this step is also scripted (or uses a Google Apps feature that I don’t know about) but I am assuming they use Gmail’s [sending email from different addresses](http://support.google.com/mail/bin/answer.py?hl=en&answer=22370) feature to accomplish this. 

This is what we think their process is like. If you work at Stripe or are familiar with their workflow, we would love to hear about it. Heck, I am sure entire Hacker News would love to. 

These are neat hacks but we think these are things a software should do for you.

### The SupportBee Way

We have a very similar workflow. We want everyone to be involved in support and know what’s going on and what sort of problems our customers are seeing. However, we use the out of box setup of SupportBee to accomplish this. 

Every time there is a new email to `support@supportbee.com`, a notification is sent out to the entire team. The person handling support at that time can reply to the notification. They can  also login to the support desk to track  the customer’s history or assign it to someone else. If the customer replies again, we send a notification to the last person who replied. This way others don’t get an email for replies to tickets they are not involved in or interested in. There is no need to filter the replies or add labels to highlight the replies coming directly to you. 

If you are not replying to a ticket but are interested in it (may be a feature you are passionate about), you can Star it in SupportBee. Now every time there is a new reply (from your team member or the customer), you will get an email notification. You can even jump in at any point and reply to the customer or post a comment to tell your team member something interesting. This way everyone sees all the issues but they see replies only for issues they are participating in or interested in. No need to setup special filters to highlight replies to your tickets or hide away other ones. 

If you like this, do read [our philosophy](https://supportbee.com/philosophy). We would also love to hear about your interesting support workflow hacks.

