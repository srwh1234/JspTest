package tw.com.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ticket_id")
	private Integer ticketId;

	@Column(name = "ticket_type_id")
	private Integer ticketTypeId;

	private String name;

	private Integer price;

	@Column(name = "total_sales")
	private Integer totalSales;

	private Integer status;

	@Column(name = "expiry_date")
	private Date expiryDate;

	private String description;

	private String content;

	private String note;

	@Column(name = "supplier_name")
	private String supplierName;

	private String city;

	private String address;

	private Double latitude;

	private Double longitude;

	@Column(name = "rating_sum")
	private Integer ratingSum;

	@Column(name = "rating_count")
	private Integer ratingCount;

}
