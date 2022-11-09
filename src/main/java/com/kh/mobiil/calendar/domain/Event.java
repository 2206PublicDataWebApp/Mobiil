package com.kh.mobiil.calendar.domain;


public class Event {

	private String title;
	private String start;
	private String end;
	private String backgroundColor;
	private String borderColor;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	@Override
	public String toString() {
		return "Event [title=" + title + ", start=" + start + ", end=" + end + ", backgroundColor=" + backgroundColor
				+ ", borderColor=" + borderColor + "]";
	}

	
	
	
		
}
