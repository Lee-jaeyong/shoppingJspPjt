package shopping.filter;

import org.junit.Test;

public class TestClass {
	int pageNum = 9;
	int showPage = 10;
	int showBlock = 10;
	int startBlock = pageNum / showPage * showBlock;
	int endBlock = startBlock + showBlock;
	int totalBlock;
	
	@Test
	public void test() {
		System.out.println(startBlock);
	}
}
