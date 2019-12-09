package shopping.database.dto;

public class ItemOptionDTO {
	private int opIdx;
	private int op_i_idx;
	private String opSize;
	private String opColor;
	private int opStock;
	private String itemName;
	
	//부족한 옵션 확인시 필요한 생성자
	public ItemOptionDTO(int opIdx,String itemName, String opSize, String opColor, int opStock) {
		this.itemName = itemName;
		this.opIdx = opIdx;
		this.opSize = opSize;
		this.opColor = opColor;
		this.opStock = opStock;
	}
	
	public ItemOptionDTO(int opIdx, int op_i_idx, String opSize, String opColor, int opStock) {
		super();
		this.opIdx = opIdx;
		this.op_i_idx = op_i_idx;
		this.opSize = opSize;
		this.opColor = opColor;
		this.opStock = opStock;
	}

	public String getItemName() {
		return itemName;
	}
	
	public int getOpIdx() {
		return opIdx;
	}

	public void setOpIdx(int opIdx) {
		this.opIdx = opIdx;
	}

	public int getOp_i_idx() {
		return op_i_idx;
	}

	public void setOp_i_idx(int op_i_idx) {
		this.op_i_idx = op_i_idx;
	}

	public String getOpSize() {
		return opSize;
	}

	public void setOpSize(String opSize) {
		this.opSize = opSize;
	}

	public String getOpColor() {
		return opColor;
	}

	public void setOpColor(String opColor) {
		this.opColor = opColor;
	}

	public int getOpStock() {
		return opStock;
	}

	public void setOpStock(int opStock) {
		this.opStock = opStock;
	}

}
