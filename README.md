# Volunteer Go
An app that won "Most Likely to Make Money" made at HackBeanpot, a hackathon run by a club at Northeastern University. The members of the team were [Joshua Qin](https://github.com/qinjoshua), [Vasu Zalawadia](https://github.com/vasuz/) who worked on the [backend code](https://github.com/qinjoshua/beanteering) and [Sadie Levy](https://github.com/levylevylevy), and myself who worked on the frontend. Specifically, Joshua worked on the authentication and API, Vasu worked on web scraping, Sadie worked on graphic design, and I worked on the Flutter code.

![Screenshot of app screens built for Volunteer Go](https://github.com/garrrettt/volunteer-go/blob/master/screenshots/Combined.png)

## Inspiration
Everyone on our team has volunteered before, and we've noticed that people really like to help their communities. We also remembered the success of Pokemon Go, so we decided to combine the two ideas.

## What it does
Volunteer Go is a smartphone app that combines gaming with real world volunteer work. You are randomly assigned a team from three choices: Owls (yellow), Foxes (orange), or Otters (blue). You can then access lists of volunteer opportunities that are detected to be near you and add them to your log. Then, the app uses location tracking to tell if you have arrived at and completed the volunteer work, and if so the event gets checked off in your log. For each event you get verified for attending, the team you are a part of gets a point added to their total score. 

Next, the app uses mapping technology to divide Boston into sections based on neighborhoods. The mapping technology figures out which team has the most points in each region, and colors that region the team color. So, get excited to volunteer more, help out your community, and assist your team in taking over the Boston map!

## How we built it
We got our data by scraping [Volunteer Match](https://www.volunteermatch.org/) to show the most relevant volunteering events in our area. Then we pulled that data to the front end by passing JSON to show the volunteering events and the current Boston map.

## Challenges we ran into
The backend team had trouble processing web requests because they had never used ASP.NET Core before. The front end was difficult in getting Google Maps to visualize the different regions that teams had taken on the Boston Map.

## Accomplishments that we're proud of
We are very proud of successfully scraping and cleaning data to use for the app as well as visualizing it on an actual interactive map.

## What's next for Volunteer Go
Volunteer Go is a proof of concept, but we hope it shows that other apps might benefit from using a model similar to Pokemon Go.
