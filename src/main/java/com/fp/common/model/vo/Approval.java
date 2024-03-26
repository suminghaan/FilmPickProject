package com.fp.common.model.vo;

public class Approval {
	private int approvalNo;
	private int approvalType;
	private int memNo;
	private int mvReviewNo;
	
	public Approval() {
		
	}

	public Approval(int approvalNo, int approvalType, int memNo, int mvReviewNo) {
		super();
		this.approvalNo = approvalNo;
		this.approvalType = approvalType;
		this.memNo = memNo;
		this.mvReviewNo = mvReviewNo;
	}

	public int getApprovalNo() {
		return approvalNo;
	}

	public void setApprovalNo(int approvalNo) {
		this.approvalNo = approvalNo;
	}

	public int getApprovalType() {
		return approvalType;
	}

	public void setApprovalType(int approvalType) {
		this.approvalType = approvalType;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getMvReviewNo() {
		return mvReviewNo;
	}

	public void setMvReviewNo(int mvReviewNo) {
		this.mvReviewNo = mvReviewNo;
	}

	@Override
	public String toString() {
		return "Approval [approvalNo=" + approvalNo + ", approvalType=" + approvalType + ", memNo=" + memNo
				+ ", mvReviewNo=" + mvReviewNo + "]";
	}
	
}
