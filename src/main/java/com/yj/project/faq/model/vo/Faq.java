package com.yj.project.faq.model.vo;

public class Faq {
	
	private int ques_num;
	private String question;
	private String answer;
	
	public Faq() {
		
	}

	public int getQues_num() {
		return ques_num;
	}

	public void setQues_num(int ques_num) {
		this.ques_num = ques_num;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Faq(int ques_num, String question, String answer) {
		super();
		this.ques_num = ques_num;
		this.question = question;
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "Faq [ques_num=" + ques_num + ", question=" + question + ", answer=" + answer + "]";
	}

}
