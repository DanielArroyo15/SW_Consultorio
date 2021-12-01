using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SW_Consultorio.Models
{
    public class CitaCalendario
    {

        public string Titulo { get; set; }

        public string Fecha { get; set; }

        public string HoraInicio { get; set; }

        public string HoraFin { get; set; }

        public int PacienteID { get; set; }

        public int MedicoID { get; set; }

        public int UsuarioID { get; set; }

        public int EstadoCitaID { get; set; }
        public int CitaCalendarioID { get; set; }

    }
}