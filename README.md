## Inspiration
We've all volunteered before, and we've noticed that people really like to help their communities. We also remembered the success of Pokemon Go, so we thought it would be perfect to combine the two ideas.

## What it does
Volunteer Go is a smartphone app that combines gaming with real world volunteer work. You are randomly assigned a team from three choices: Owls (yellow), Foxes (orange), or Otters (blue). You can then access lists of volunteer opportunities that are detected to be near you and add them to your log. Then, the app uses location tracking to tell if you have arrived at and completed the volunteer work, and if so the event gets checked off in your log. For each event you get verified for attending, the team you are a part of gets a point added to their total score. 

Next, the app uses mapping technology to divy Boston into sections based on neighborhood. The mapping technology figures out which team has the most points in each region, and colors that region the team color. So, get excited to volunteer more, help out your community, and assist your team in taking over the Boston map!

## How I built it
We got our data by scraping Volunteer Match to show the most relevant volunteering events in our area. Then we pulled that data to the front end by passing JSON to show the volunteering events and the current Boston map.

## Challenges I ran into
The backend team had trouble processing web requests because they had never used ASP.NET Core before. The front end was difficult in getting Google Maps to visualize the different regions that teams had taken on the Boston Map.

## Accomplishments that I'm proud of
We are very proud of successfully scraping and cleaning data to use for the app as well as visualizing it on an actual interactive map.

## What I learned
The backend team learned ASP.NET Core, and I learned more about the Flutter framework.

## What's next for Volunteer Go
Volunteer Go is more of a proof of concept, but we hope that it shows that other apps might benefit from using a model similar to Pokemon Go.


