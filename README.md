Rails Movie Recommendations
===========================

##Purpose:
This is a Capstone project for NSS Cohort 2. I am making a movie recommendatin app in Rails to show my understanding of ruby, rails, TDD, sending data to a database, and retrieving it from a database.

Features:
1. Get movie recommendations based on a movie title you type in
2. Each user has a watch list that holds the movie info of the movies that are recommended to the user that the user wants to see at a later time.
3. Each user has a already watched list that holds the movie info of the movies that are recommended to the user that the user has already watched.
4. Movies that are listed in the Watch List or Already Watched List will not be recommended to the user again.

##ToDo/Project State:
-Devise, user login
-recommendation search bar
-recommendation results page
-individual movie info from recommendation results (with back button from movie info to results)


##ToDo:
-build "Watch List" screen with individual movie info screen
-build "Already Watched List" screen with individule movie info screeen
-write tests as I build those sections of app


##Changelog:
2013-06-11: Started Project 2013-06-11: Idea is complete, wireframming is complete
2013-06-19: Added movie recommendation search bar, results page, and individule movie info with a back button

##Usage:
This is a standard rails app. To run the tests, use 'rake'. To run the app, use 'railes s'.

##API's
Tastekid.com - To get the movie recommendations
OMDBapi.com - To get information on the movies

##Author:
Dane Hale

##License:
The MIT License (MIT)

Copyright (c) 2013 Dane Hale

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
