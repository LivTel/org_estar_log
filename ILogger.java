// ILogger.java
package org.estar.log;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;

/**
 * This interface should be implmented by any class that is a logger.
 */
public interface ILogger
{
	/**
	 * Log a message to log file.
	 * @param logMessage The message to log.
	 */
	public void log(String logMessage);
	/**
	 * Log an error message to log file.
	 * @param logMessage The message to log as an error.
	 */
	public void error(String logMessage);
	/**
	 * Log an error message to log file.
	 * @param logMessage The message to log as an error.
	 * @param e An exception to print.
	 */
	public void error(String logMessage,Exception e);
};
//
// $Log: not supported by cvs2svn $
//
