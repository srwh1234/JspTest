package tw.com.dao;

import java.util.List;

import org.hibernate.Session;

import tw.com.hibernate.HibernateUtil;

interface BaseDao<T> {

	public T selectById(int id);

	public List<T> selectAll();

	public T update(T t);

	public boolean insert(T t);

	public boolean deleteById(int id);

	default Session getSession() {
		return HibernateUtil.getSessionFactory().getCurrentSession();
	}

}
