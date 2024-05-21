# Changelog

# 2024

* April 12 - Progressively enhanced combobox for developer specialties #820 @MiaSinek
* January 19 - Add GitLab profile to Dev Profile, under Online Presence section

# 2023

### June

* June 21 - Sort developers by recently updated, by default #871
* June 21 - Notify admins of recent LinkedIn profile changes #839 @sarvaiyanidhi
* June 7 - Render signed hiring agreement PDFs via Prawn #870

### April

* April 8 - Send subscription renewal email #860 @jkostolansky
* April 7 - Launch recommended sorting option #859
* April 5 - Distinguish between new profiles and recently updated ones #856
* April 4 - Remove `developers.available_on` #854

### March

* March 31 - Admin dashboard for referrals #799 @hafezbusra
* March 30 - Affiliate program landing page and sign up form #850
* March 28 - Refactor `Hired::Form` into `Developers::CelebrationPackageRequest` #836 @MikeRayUX
* March 25 - Add developer scheduling link #838 @jkostolansky
* March 23 - Business survey email + opt-out checkbox #830
* March 21 - Added business new hire forms and admin new hire forms #818 @RomanTurner @MikeRayUX
* March 21 - Announce specialties to developers #817 @sarvaiyanidhi
* March 20 - Update developer query to not duplicate records with multiple matching specialties #822 @bschrag620
* March 18 - Add developer specialties #803
* March 16 - Don't retry emails for invalid/unsubscribed recipients #798 @zzJZzz
* March 15 - Fix Preview image doesn't change when select new avatar in profile page #787 @ryy
* March 10 - Automate subscriber cancellation email #795 @sarvaiyanidhi
* March 8 - Add a tooltip to replied and email headers on the admin conversations dashboard #796 @franlocus
* March 7 - Automate subscriber welcome email #794 @duncantmiller
* March 3 - Upgrade Devise to v4.9.0 to support hotwire turbo integration #786 @sarvaiyanidhi
* March 1 - Add a badge for developers with a high response rate #774 @fig

### February

* February 28 - Don't show welcome notifications in UI #790 @gathuku
* February 26 - Business welcome emails #772 @accua
* February 18 - Add "referred by" to admin emails #780 @PatrickMcSweeny
* February 16 - Add support for Mastodon handles #778 @jordelver
* February 8 - Throttle requests to prevent brute-force attacks
* February 4 - Remove availability from developer profiles
* February 3 - Filter by developer badges #759 @sarvaiyanidhi

### January

* January 26 - Tombstone deleted profiles #751 @troyizzle
* January 26 - Redirect suspended accounts
* January 24 - Revamp CTA design with blurred out developers #743 @izaguirrejoe
* January 1 - Hiring agreement announcement email #749

## 2022

### November

* November 30 - Update Pay gem to v6.1.0, Strope to v8.0.0 and clean pause subscription logic #726 @sarvaiyanidhi
* November 27 - Paywall page 2+ of developer search results #734
* November 26 - Obfuscate developer profile URLs #731
* November 23 - Save referral code when creating an account #730
* November 8 - Do not add hrefs for transaction without urls #722 @kaushikhande
* November 3 - Publicly shareable URLs via modal #647 @sarvaiyanidhi

### October

* October 28 - Tag for source RailsDevs source code contributors #677 @benmercerdev
* October 21 - Option to ignore pages from being tracked in Fathom #706
* October 20 - Upgrade Tailwind CSS to v3.2 #700
* October 19 - Upgrade to Turbo 7.2.2 #683 @sarvaiyanidhi
* October 12 - Remove manual payments and account for payments made via ACH #681
* October 12 - Update to rails 7.0.4 #682 @kaushikhande
* October 7 - Bring back 1x and 2x avatar variants and remove lazy image loading #680 @jkostolansky

### September

* September 22  - Display developer private information with publicly shared URL #646 @sarvaiyanidhi
* September 21 - Only show page 1 of search results to non-subscribers #661 @mansakondo
* September 18 - Add badges to developer profile pages #657
* September 18 - Obfuscate developer profiles URLs #656
* September 16 - Show "Recently Active" badge for developers active in last 7 days #640 @sarvaiyanidhi
* September 15 - Allow rich text for developer bios #638 @rayhanw
* September 15 - Show "Featured" badge in search results #642
* September 14 - Only ever send one Celebration Promotion email #617 @sarvaiyanidhi
* September 13 - Impersonate users directly from `/admin/users` #627 @KarlHeitmann
* September 13 - Move developer bio to own card in form and add more instructions #635 @rayhanw
* September 8 - Send admins a notification when a `Hired::Form` is created #614 @sarvaiyanidhi
* September 8 – Update license year and note non-code usage #630
* September 8 – Remove part-time hiring plan from pricing page #628

### August

* August 27 - Add a URL to Admin::SubscriptionChangeNotification #612
* August 27 - Fixes an issue where Safari would never load retina images #619
* August 25 - Create and deliver all notifications when seeding database #616
* August 23 - Developer celebration flow #610
* August 21 - Expand `User` filtering to developer & business #608
* August 19 - Removed developer Twitter handle from Open Graph tags #607
* August 19 - Convert reusable `/admin` components to View Components #605
* August 18 - Add basic admin user search #604
* August 17 - Send admins notifications on subscription changes #600
* August 10 - Fixes an issue where uploaded avatars wouldn't render their preview #596
* August 8 - railsdevs -> RailsDevs #595
* August 6 - Fixes a bug where responding to messages via email wouldn't send #579 @benngarcia

### July

* July 30 - Migrate from Action Mailbox to Postmark JSON API - #588
* July 27 - Change developer bio text - #560 @kaushikhande
* July 20 - Normalize business website link - #577 @ypcethan
* July 19 - Add Stack Overflow link to developer profile - #581 @ypcethan
* July 13 - Update to Pay 4.0.1 and Stripe 6.5.0 - #574
* July 12 - Update to rails 7.0.3.1
* July 11 - Invisible captcha when registering for an account - #563
* July 11 - Fix scroll to bottom and autofocus on conversation page - #521 @pkayokay
* July 10 - Seed developer and business avatar images from Unsplash - #530 @adrienpoly
* July 10 - 1x and 2x image size variants of avatars - #555 @adrienpoly
* July 10 - Add privacy policy and terms & conditions - #557
* July 9 - In-app purchase support on iOS via RevenueCat - #549
* July 7 - Impersonate users as an admin - #544
* July 1 - Fixes a bug where creating an invisible developer would raise an error - #534 @joshio1

### June

* June 28 - Add plain text devise emails - #516 @jamgar
* June 28 - Long-tail SEO pages for /developers #507
* June 28 - Display X of Y developers in search results - #502
* June 28 - Site-wide banner indicating your profile is invisible - #509 @joshio1
* June 24 - Added configuration to lazily load images - #520 @joshio1
* June 23 - Added "Invisiblize" button on business profiles (for admins) - #510 @DRBragg
* June 19 - Admins can view invisible developer profiles - #505 @kaushikhande
* June 17 - Read indicators for messages - #485 @troyizzle
* June 16 - Note hiring fees on `/open/revenue` #501
* June 14 - Add support for iOS app powered by Turbo Native - #496
* June 13 - Fix sorting on mobile - #495
* June 13 - Add empty state for `/developers` - #484 @bensheldon
* June 13 - Remove `turbo: false` from all non-Stripe forms - #483
* June 9 - Order conversations by most recent message, not when they were started
* June 8 - Add text search for developers (for paid accounts) - #470 @troyizzle
* June 8 - Add country search for developers - #468 @troyizzle
* June 8 - Refactor non-reusable View Components under model named module - #456, #462, #471, #476, #478, #480 @metamoni

### May

* May 31 - Email developers tips when they get their first message - #422 @seagalputra
* May 29 - Send notifications about stale profiles to developers - #420 @mrtnin
* May 26 - Strip HTML tags from developer bios - #446
* May 21 - Accessibility updates - #436 and #440 @metamoni
* May 9 - Send daily/weekly emails via broadcast stream - #421
* May 8 - Send automated emails from `@railsdevs.com` -#414
* May 8 - Stop business welcome email and clean up developer welcome email -#413
* May 2 - Revamped business profiles - #397 @scottharvey

### April

* April 30 - Featured developers - #399
* April 25 - Rework nav bar to use a single menu - #386
* April 23 - Add 10% fee acceptance checkbox - #371 @kaushikhande
* April 22 - Add link to conversations in navigation bar - #384
* April 21 - Note interested role types on cold message form - #383
* April 18 - Automatically send Developer and Business welcome emails - #378 @tim-carey-code
* April 18 - Added banner to connect with Joe to pay hiring fee - #380
* April 12 - Added messaging tips for businesses - #376
* April 10 - Added "Invisiblize" button on developer profiles (for admins) - #370 @DRBragg
* April 7 - Migrate email sending from Mailgun to Postmark - #365
* April 7 - Added `/admin/conversations` - #368

### March

* March 31 - Show message preview in notification email - #357
* March 21 - Hotwire-ified sending messages - #334
* March 21 - Added keyboard shortcuts to send a message - <kbd>⌘</kbd>+<kbd>Enter</kbd> or <kbd>⌃</kbd>+<kbd>Enter</kbd> - #335 @jasonplatts
* March 16 - Application defaults were upgraded to Rails 7.0 - #330
* March 14 - Added button to mark all notifications as read - #320 @gathuku
* March 9 - Pricing v2 - #314
* March 6 - Added more robust database seeds for local development - #312
* March 6 - Added option to hide your profile from the public - #288 @GALTdea
* March 7 - Added a filter for role level - #306 @themudassarhassan
* March 4 - Added a banner to let developers know their profile is incomplete - #310
* March 1 - Ported filters to mobile - #304 @dhairyagabha

### February

* February 26 - Added role level to developer profiles - #300 @kaushikhande
* February 24 - Added role type and search status filters - #268 @themudassarhassan
* February 24 - Anonymized avatar filenames - #295
* February 15 - Added event tracking via Fathom - #283
* February 10 - Added Brazilian Portuguese (pt-BR) translations - #278 @gmmcal
* February 2 - Added [open startup page](https://railsdevs.com/open) - #270

### January

* January 29 - Added Spanish (es) translations - #264
* January 27 - Made links in messages clickable - #262 @djfpaagman
* January 24 - Added role type filters - #251 @themudassarhassan
* January 13 - Added email notifications of new developers - #212 @jacobdaddario
* January 9 - Removed compensation from RailsDevs - #231
* January 8 - Added hourly rate, salary, and time zone filters - #225
* January 7 - Added sorting of developers (newest or available) - #177
* January 3 - Added CTA for paywalled content - #206 and #193 @jacobdaddario
* January 1 - Added `/notifications` - #182 @jayeclark

> Changes before January 1, 2022 can be found by reading through [merged PRs](https://github.com/joemasilotti/railsdevs.com/pulls?q=is%3Apr+is%3Amerged).
