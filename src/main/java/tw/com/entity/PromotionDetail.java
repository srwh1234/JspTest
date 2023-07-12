package tw.com.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "promotion_detail")
public class PromotionDetail {

	@EmbeddedId
	private PrimaryKey key;

	@Column(name = "promotion_price")
	private Integer promotionPrice;

	@OneToOne
	@JoinColumn(name = "ticket_id", insertable = false, updatable = false)
	private Ticket ticket;

	@Embeddable
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class PrimaryKey implements Serializable {

		private static final long serialVersionUID = 1L;

		@Column(name = "promotion_id")
		private Integer promotionId;

		@Column(name = "ticket_id")
		private Integer ticketId;

	}
}
