package com.superkids.domain

enum CallResult {
	VOICEMAIL,
	LEFT_MESSAGE,
	CALLBACK,
	NO_ANSWER,
	BUSY,
	DUPLICATE,
	DISCONNECT,
	DIR_ASSIST,
	WRONG_NUMBER,
	REFUSED,
	TERMINATED,
	NOT_QUALIFIED,
	RNA,
	OTHER,
	QUALIFIED,
	INCOMPLETE;


	String getKey() {
		name()
	}
}