# feed_me_assignment

Take home test for McDonalds use case.

## Introduction

Widgets folder contains all UI components while Models folder contains data handling
and data classes. Mainly models between bots and orders.

## Optimizations

Due to restrictions of not using Dart modules. Advanced built-in functions of Dart List or 
other Dart collections structures are not used. Only functions related to list add and remove 
functions are used. Bots can be optimized to use a Stack whereas Pending Orders can be optimized 
to use Priority Queues.

Context handling can also be changed to use navigator's context if there is routing across
multiple widgets/pages.
