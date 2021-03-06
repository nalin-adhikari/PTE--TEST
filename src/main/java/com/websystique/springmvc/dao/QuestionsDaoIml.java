/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Questions;
import com.websystique.springmvc.model.Sections;
import java.util.Collection;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ashis
 */
@Repository("QuestionsDao")
public class QuestionsDaoIml extends AbstractDao<Integer, Questions> implements QuestionsDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Questions findById(int id) {

        Questions questions = getByKey(id);
        return questions;

        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(Questions questions) {

        persist(questions);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Questions> findAllQuestions() {

        Criteria criteria = createEntityCriteria().addOrder(Order.asc("questionId"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Questions> questions = (List<Questions>) criteria.list();

        return questions;

        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

//    
//
//    public Collection<Questions> findAllQuestionsBySectionId(int sectionId) {
//        Collection<Questions> data = null;
//        try {
//            
//            Session session = sessionFactory.openSession();
//
//            data = sessionFactory.getCurrentSession().
//                    createQuery("SELECT q FROM Questions q WHERE q.sectionId = :sectionId").
//                    setString("sectionId", String.valueOf(sectionId)).
//                    list();
//            System.out.println("" + data);
//            System.out.println("" + data);
//        } catch (Exception exe) {
//        }
//
//        return data;
//
////throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
    @SuppressWarnings("unchecked")
    public Collection<Questions> findAllQuestionsBySectionId(Integer sectionId, Integer offset, Integer maxResults) {

        Collection<Questions> data = null;
        try {

            Session session = sessionFactory.openSession();

            data = (sessionFactory.getCurrentSession().
                    createQuery("SELECT q FROM Questions q WHERE q.sectionId = :sectionId").
                    setString("sectionId", String.valueOf(sectionId)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).setFirstResult(offset != null ? offset : 0)
                    .setMaxResults(maxResults != null ? maxResults : 1)).list();
            System.out.println("" + data);
            System.out.println("" + data);
        } catch (Exception exe) {
        }

        return data;

//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
 @SuppressWarnings("unchecked")
    public Long CountQuestions(Integer sectionId) {
           
        return ((Long)getSession().createQuery("select count(*) from Questions  WHERE sectionId = :sectionId").
                    setString("sectionId", String.valueOf(sectionId)).uniqueResult());

    }
    
     @SuppressWarnings("unchecked")
    public Long CountQuestionsByCatId(Integer cat_id) {
       
        
        return ((Long)getSession().  createQuery("select count(*) from Questions  WHERE catId = :catId").
                    setString("catId", String.valueOf(cat_id)).uniqueResult());
    
    }
}
