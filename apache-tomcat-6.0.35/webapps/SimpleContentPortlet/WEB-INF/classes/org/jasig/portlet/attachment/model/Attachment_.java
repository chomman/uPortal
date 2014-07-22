package org.jasig.portlet.attachment.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Attachment.class)
public abstract class Attachment_ {

	public static volatile SingularAttribute<Attachment, String> guid;
	public static volatile SingularAttribute<Attachment, Long> id;
	public static volatile SingularAttribute<Attachment, Date> modifiedAt;
	public static volatile SingularAttribute<Attachment, String> createdBy;
	public static volatile SingularAttribute<Attachment, String> source;
	public static volatile SingularAttribute<Attachment, String> modifiedBy;
	public static volatile SingularAttribute<Attachment, Date> createdAt;
	public static volatile SingularAttribute<Attachment, String> data;
	public static volatile SingularAttribute<Attachment, String> path;
	public static volatile SingularAttribute<Attachment, String> filename;
	public static volatile SingularAttribute<Attachment, String> checksum;

}

