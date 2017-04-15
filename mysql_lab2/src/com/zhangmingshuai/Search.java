package com.zhangmingshuai;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sun.applet.Main;

import com.mysql.jdbc.PreparedStatement;
import com.sun.java_cup.internal.runtime.Scanner;
import com.sun.java_cup.internal.runtime.Symbol;
import com.sun.org.apache.xpath.internal.Arg;

/**
 * CreateDate：2017-5-20下午02:00:08
 * Location：HIT
 * Author: Zhang Mingshuai
 * TODO
 * return
 */
public class Search {
	
	private ArrayList<String> store;
	private int id;
	private String param;
	public Search(int id, String param){
		this.id = id;
		this.param = new String(param);
		store = new ArrayList<String>();
		store.add("select snumber from sc where cnumber = ? ");
		store.add("select cnumber,score from sc where snumber=?");
		store.add("select student.sname from sc,student,course " +
				"where sc.snumber=student.snumber and sc.cnumber=course.cnumber " +
				"and course.cname=?");
		store.add("select c.cname,c.chours,c.credit,c.csemster" +
				" from course as c,sc,student where sc.snumber=student.snumber " +
				"and sc.cnumber=c.cnumber and student.sname=?");
		store.add("select student.sname,sc.cnumber,sc.score from sc,student where"+
				" sc.snumber=student.snumber and score>?");
		store.add("select snumber,avg(score) from sc group by snumber having avg(score)<?");
		store.add("select count(*) from sc,student where student.snumber=sc.snumber "+
				"and student.sname=?");
		store.add("select max(score),min(score),avg(score) from sc group by cnumber " +
				"having cnumber in (select cnumber from course where cname=?)");
	}
	
	public String getResult() throws SQLException{
		StringBuffer result= new StringBuffer();
//		System.out.println(param);
		Connection my = GetConnection.get();
		java.sql.PreparedStatement ps = my.prepareStatement(store.get(id));
		ps.setString(1, param);
		ResultSet rs = ps.executeQuery();
		switch (id) {
		case 0:
			result.append("选择了课程号为 "+ param +" 的学生学号为:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"\n");
			}
			break;
		case 1:
			result.append("学号为 "+ param +" 的学生选择的所有课程号和成绩为:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"   "+rs.getString(2)+"\n");
			}
			break;
		case 2:
			result.append("选择了课程名为 "+ param +" 的学生的姓名为:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"\n");
			}
			break;
		case 3:
			result.append("姓名为 "+ param +" 的学生所选所有课程的课程名，学时，学分和开课学期号为:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"   "+rs.getString(2)+
						"   "+rs.getString(3)+"   "+rs.getString(4)+"\n");
			}
			break;
		case 4:
			result.append("查询成绩在 "+ param +" 分以上的学生姓名、课程号和成绩为:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"   "+rs.getString(2)+"   "+rs.getString(3)+"\n");
			}
			break;
		case 5:
			result.append("统计选课平均分低于 "+ param +" 的学生学号和成绩为:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"   "+rs.getString(2)+"\n");
			}
			break;
		case 6:
			result.append("统计姓名为 "+ param +" 的学生选修的课程数:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"\n");
			}
			break;
		case 7:
			result.append("查询课程名为 "+ param +" 的课程的最高分、最低分和平均分:\n");
			while(rs.next()){
				result.append(rs.getString(1)+"   "+rs.getString(2)+"   "+rs.getString(3)+"\n");
			}
			break;
		default:
			result.append("illegal input!");
		}
		return result.toString();
	}
	
}

