// ILoggable.java
package org.estar.log;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;

/**
 * This interface should be implmented by any class that wants to send log messages to
 * some client application that has registered a logger.
 */
public interface ILoggable
{
	/**
	 * Add a logger to the list of loggers to call.
	 */
	public void addLogger(ILogger l);
	/**
	 * Delete a logger from the list of loggers to call.
	 */
	public void deleteLogger(ILogger l);
};
//
// $Log: not supported by cvs2svn $
//
