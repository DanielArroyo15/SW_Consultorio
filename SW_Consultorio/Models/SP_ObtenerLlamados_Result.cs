//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SW_Consultorio.Models
{
    using System;
    
    public partial class SP_ObtenerLlamados_Result
    {
        public int CitaID { get; set; }
        public int EstadoCitaID { get; set; }
        public Nullable<System.DateTime> FechaAtencion { get; set; }
        public Nullable<System.TimeSpan> InicioAtencion { get; set; }
        public string Obervacion { get; set; }
        public string Dni { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
    }
}
