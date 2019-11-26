package shopping.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import shopping.database.MyBatisConnectionFactory;
import shopping.database.dao.BoardDAO;

public class TestClass {
		
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSessionFactory().openSession(true);

	BoardDAO board = sqlSession.getMapper(BoardDAO.class);

	@Test
	public void test() {
		System.out.println(board.selectNow());
	}
}
