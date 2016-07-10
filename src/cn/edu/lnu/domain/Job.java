package cn.edu.lnu.domain;

import java.io.Serializable;

public class Job implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1974617916481069086L;
	private String jobId;
	private String jobName;
	private float lowestPay;
	private float highstPay;
	
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public float getLowestPay() {
		return lowestPay;
	}
	public void setLowestPay(float lowestPay) {
		this.lowestPay = lowestPay;
	}
	public float getHighstPay() {
		return highstPay;
	}
	public void setHighstPay(float highstPay) {
		this.highstPay = highstPay;
	}
	
	
}
