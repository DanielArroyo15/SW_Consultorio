using SW_Consultorio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SW_Consultorio.Controllers
{
    public class CalendarController : Controller
    {
        DB_SWCDEntities db = new DB_SWCDEntities();

        // GET: Calendar
        public ActionResult Calendario()
        {
            var medicos = db.Medico.ToList();
            var pacientes = db.Paciente.ToList();
            ViewBag.Medicos = medicos;
            ViewBag.Pacientes = pacientes;
            return View(medicos);
        }

        public JsonResult ListaCita()
        {
            bool ConfiguraProxy = db.Configuration.ProxyCreationEnabled;
             List<CitaCalendario> lst = new List<CitaCalendario>();
           // List<Cita> lst = new List<Cita>();

            try
            {
                db.Configuration.ProxyCreationEnabled = false;
                var citas = db.Cita.ToList();

                foreach (var item in citas)
                {
                    lst.Add(new CitaCalendario
                    {
                        //PacienteID = item.PacienteID,
                        //FechaAtencion = item.FechaAtencion.ToString(),
                        //HoraInicio = item.InicioAtencion.Value.ToString(),
                        //HoraFin = item.FinAtencion.Value.ToString(),
                        //MedicoID = item.MedicoID,
                        //Observacion = item.Obervacion
                        Observacion = item.Obervacion,
                        FechaAtencion = item.FechaAtencion.Value.ToShortDateString(),
                        HoraInicio = item.InicioAtencion.Value.ToString(),
                        HoraFin = item.FinAtencion.Value.ToString()
                    }) ;
                }

                return Json(lst, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return (ViewBag.Error("Error"));
            }
            finally
            {
                db.Configuration.ProxyCreationEnabled = ConfiguraProxy;
            }

        }

        public JsonResult Guardar(Cita ocitas)
        {
            bool respuesta = true;

            try
            {
                if(ocitas.CitaID == 0)
                {
                    
                    db.Cita.Add(ocitas);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = "" + ex;
                respuesta = false;
            }
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }
    }
}