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
            List<CitaCalendario> list = new List<CitaCalendario>();

            try
            {
                db.Configuration.ProxyCreationEnabled = false;
                var citas= db.Cita.ToList();

                foreach (var item in citas)
                {
                    list.Add(new CitaCalendario
                    {
                        Titulo = item.Obervacion,
                        FechaAtencion = item.FechaAtencion.Value.ToShortDateString(),
                        HoraInicio = item.InicioAtencion.Value.ToString(),
                        HoraFin = item.FinAtencion.Value.ToString()
                    });
                }

                return Json(list,JsonRequestBehavior.AllowGet);
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
    }
}