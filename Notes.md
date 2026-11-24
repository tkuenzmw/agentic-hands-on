# 1: What changes when an AI agent can use MATLAB?

You --> Codex <-- read code, edit files, use tools --> MATLAB

This is more than code generation. The agent can inspect the project, change it, run MATLAB, observe the result and continue working.

# 2: Our starting point
Inspect analysis.m and its segmentation result. The code is not scalable and not well structured, but it does what it is supposed to do. But what happens when I want to run it on another image, adjust the analysis, or give it to someone else?

Issues:
* hard-coded input/output paths
* magic segmentation parameters
* no separation of analysis and visualization
* no function interface
* no validation of inputs
* no tests
* no provenance of parameters
* assumes one image
* results are difficult to reproduce systematically

# 3: Let the agent understand before it changes

Try this prompt:

"Look at this project and explain what the MATLAB analysis does.

Do not change any files yet.

Then run the existing analysis using MATLAB and inspect whether
it executes successfully."

# 4: Give the agent a bounded task

Prompt something like this:
"I would like to reuse this analysis on other images.

Refactor the script so that the input image and important
segmentation parameters are easy to change.

Keep the segmentation method and current behavior otherwise unchanged.

Explain what you intend to change before changing the files."

!! Read its proposal before you let it continue !!

After the changes are done: Run the modified analysis in MATLAB and check that it still works on the original image.

# 5: Running successfully is evidence, not proof

The agent can check
* Does the MATLAB code execute?
* Did it produce an image/table?
* Did an error occur?
* Did the refactoring preserve obvious behavior?

You still have to judge
* Is this the right analysis?
* Does the segmentation make biological sense?
* Are these parameter choices defensible?
* Does the result support the scientific conclusion?

Delegate execution. Don't delegate scientific judgement.

# 6: Experiment!

"Can you visualize the measured cell areas?"

"Add eccentricity to the measurements and explain what it means."

"Can you make it easier to try different segmentation parameters?"

"The segmentation doesn't look good. Help me understand which parameter I should adjust."

# 7: Summary / take-home-messages
The agentic workflow goes a bit like this...

ASK --> INSPECT --> RUN --> VERIFY --> change / continue --> ask ...

! Tell the agent when you want it to stop and ask you.
! Judge claims from evidence, not from how confidently the agent reports success. We all know how good language models are at _sounding_ correct - even if they are completely wrong!