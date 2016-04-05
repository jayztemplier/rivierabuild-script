RivieraBuild Xcode Integration
===================

Script to automatically upload a build to Riviera Build when you archive your project.
For more information about our API, please go to [http://api.rivierabuild.com/](http://api.rivierabuild.com/)

Instruction
===================

1. Open your project
2. Edit the scheme of the target of your application
3. Unfold the Archive section
4. Select the Post-actions item
5. Tap on the small '+' to add a script
6. Make sure to select the target or your application (to use its configuration)
7. Copy past the content of the scripte-example.sh file<br/>
![Alt text](/screenshot_1.png?raw=true "Post Action Script")
8. Customize the script (password, availability etc)
9. You can now launch the Archive command: it will, at the end, open the uploaded link into your webbrowser, you'll also have the link in your clipboard
