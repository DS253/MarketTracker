# A Sample iOS Application

This is a partial implementation of a Cryptocurrency Market Tracker. While incomplete, some takeaways:

  - I can build iOS applications!
  - Code design can be determined from what has been implemented at this point.
  - I still have decisions to make on the direction and design of the application

Sure, it's not perfect (yet). With the benefit of code reviews and team discussion, the design choices would be different. Naming conventions would be different. Hey, with a UI designer, the UI would look different! But this should demonstrate I have knowledge of standard design principles and know my way around Xcode and Interface Builder comfortably.

# Features

  - Use of the CoinMarketCap.com Professional API package to populate the Coins ViewController
  - A Watchlist ViewController to pare down the list of coins to ones to follow
  - The ability to toggle between a Day Theme and Night Theme

# Things To Do

There's quite a bit left to do for this to reach market: 

  - Persistence - The Watchlist and selected Day/Night Theme need to be saved. CoreData? Realm?
  - Webservice - The CloudManager only retrieves the first 100 coins (CoinMarketCap maximum). Paging needs to be added. Also, the CoinMarketCap API offers plenty of options for how data is returned. The CloudManager and URLBuilder should evolve to meet the needs of the application and what the CMC API offers.
  - A CoinDetails ViewController - There is currently a lot of data being retrieved that isn't displayed. A CoinDetails VC with graphs, market cap, available exchanges, etc. is needed to display all the available data.
  - The News ViewController - The NewsVC along with the entire feature needs to be designed and implemented. Initial research indicates RSS Feeds are the more commonly shared news data. XML Parsing might be required.
  - The More ViewController - More features need to be added.
  - Build a separate webservice API. Since this is a paid subscription, there is a daily, weekly, and monthly API credit limit. Building a webservice that pings the CMC API every minute would ensure the credit limit is never exceeded. The application would then use this webservice instead of CMC's API.
  - A loading view. I've spent too  much time waiting for the data to return from the CMC API :)  
Thank you for reading, and I look forward to answering your questions!
  
