	.text

/* Switch from current_thread to next_thread. Make next_thread
 * the current_thread, and set next_thread to 0.
 * Use eax as a temporary register; it is caller saved.
 */
	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */
    // push context
    pushal
    // save stack pointer
    movl current_thread, %eax
    movl %esp, (%eax)
    // load new stack
    movl next_thread, %eax
    movl (%eax), %esp
    // point current_thread to next_thread
    movl next_thread, %eax
    movl %eax, current_thread
    // load context
    popal
	ret				/* pop return address from stack */