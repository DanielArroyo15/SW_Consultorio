using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SW_Consultorio.Models
{
    public class CitaCalendario
    {
        public string Titulo { get; set; }

        public string FechaAtencion { get; set; }

        public string HoraInicio { get; set; }

        public string HoraFin { get; set; }
    }
}