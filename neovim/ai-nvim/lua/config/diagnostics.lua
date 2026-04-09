-- I have used virtual lines for a while now, and I'm still not sure if i like
-- them or not. It is nice that errors stay hidden so my buffer isn't so
-- cluttered. On the other hand its kinda painful to navigate to a line to see
-- the error.

-- Known issue
-- when the virtual line showing errors/warnings _and_ the window showing
-- compleations are displayed at the same time, the virtual line will be
-- displaced and when the window dissapears the line will be in the wrong
-- position. Maybe there is a way to supress the diagnostic while the
-- compleation window is open?

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
	},
})
