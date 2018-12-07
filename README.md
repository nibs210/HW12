# HW12
P&amp;E Homework 12 FINAL PRESENTATION
# Machines Making Art

I will be using Processing to allow a machine to modify existing 3D models and create art with minimal human input.

## Summary

The goal of my project is to create a processing sketch that can take a model, modify it without any human input, then render and save this file as it's own model, different from the original. a rudimentary form of "AI making art", so to speak. To do this, i'll be using the HE_Mesh libraries, and parts of some old abandoned code projects from a previous semester, modifying them extensively for both this project, as well as the presentation itself. to extend the "machines making art" idea, i will also be 3D printing the model that this processing sketch produces, and will be passing it around for the class to look at while i present the project.

## Component Parts


This project relies heavily on the HE_mesh library, which has hundreds and hundreds of different components. on top of that, i'm also including 3D printing, which is its own field full of challenges on its own.

The way the program works: HE_mesh has a library named RnadomRay. unfortunately all libraries are packaged in Java, so i'm unable to crack them open and study their base code (spent 4 hours trying, though). What RandomRay does, from the best i can tell, is in the first frame of the render, it detects the rendered light source, and sees what vertices of the 3D model are being hit by the light source. any vertice on the 3D model that isn't being lit up by the light is added to the preset amount of vertices that it's allowed to change. it then pulls the vertices away from the model by a randomized amount, and then after 300 frames the library WB_AABBTree takes over, and smoothes all the vertices out, creating a brand new 3D model. after that, i programmed a quick void command that saves the new mesh as a .obj whenever the mouse is clicked inside the render. the new file is named based on the current date/time, and deposited in the same folder that the processing sketch is located.

## Challenges

The HE_mesh library is INCREDIBLY diverse and extensive, and often hard to really grasp. that, combined with some spotty memory about the older, re-used parts of the project has led to a lot of confusion and difficulty getting it to work.

## Timeline

What did you do in each of the past four weeks?

- Week 1: Write proposal
- Week 2: Resurrecting the parts of the old, abaondoned project that are relevant to this current idea.
- Week 3: getting the code up and running, producing the modified 3D model, and then printing it for use in the presentation.
- Week 4: Present!

## Completed Work

https://imgur.com/a/shlqTZ9

## References and links

https://www.wblut.com/
https://www.creativeapplications.net/processing/hemesh-and-hemeshgui-processing/
