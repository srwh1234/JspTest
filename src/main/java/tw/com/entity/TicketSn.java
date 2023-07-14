package tw.com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "ticket_sn")
public class TicketSn {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ticket_sn_id")
	public Integer ticketSnId;

	@OneToOne
	@JoinColumn(name = "ticket_id")
	public Ticket ticket;

	@Column(name = "serial_number")
	public String serialNumber;

	public Integer status;
}
